# --------------------------------------------
# EKS Cluster Security Group
# --------------------------------------------

resource "aws_security_group" "eks_cluster" {
  name        = "${var.project_name}-${var.environment}-eks-cluster-sg"
  description = "Security Group for EKS Control Plane"
  vpc_id      = var.vpc_id

  tags = merge(var.additional_tags, {
    Name = "${var.project_name}-eks-cluster-sg"
  })
}

# --------------------------------------------
# Worker Node Security Group
# --------------------------------------------

resource "aws_security_group" "worker_nodes" {
  name        = "${var.project_name}-${var.environment}-worker-node-sg"
  description = "Security Group for EKS Worker Nodes"
  vpc_id      = var.vpc_id

  tags = merge(var.additional_tags, {
    Name = "${var.project_name}-worker-node-sg"
  })
}

# --------------------------------------------
# Cluster API (HTTPS)
# --------------------------------------------

resource "aws_security_group_rule" "cluster_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"

  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.worker_nodes.id
}

# --------------------------------------------
# Worker Nodes Communication
# --------------------------------------------

resource "aws_security_group_rule" "worker_to_worker" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"

  security_group_id        = aws_security_group.worker_nodes.id
  source_security_group_id = aws_security_group.worker_nodes.id
}

# --------------------------------------------
# Cluster -> Worker Nodes
# --------------------------------------------

resource "aws_security_group_rule" "cluster_to_worker" {
  type              = "ingress"
  from_port         = 1025
  to_port           = 65535
  protocol          = "tcp"

  security_group_id        = aws_security_group.worker_nodes.id
  source_security_group_id = aws_security_group.eks_cluster.id
}

# --------------------------------------------
# Outbound Traffic
# --------------------------------------------

resource "aws_security_group_rule" "cluster_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"

  cidr_blocks       = ["0.0.0.0/0"]

  security_group_id = aws_security_group.eks_cluster.id
}

resource "aws_security_group_rule" "worker_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"

  cidr_blocks       = ["0.0.0.0/0"]

  security_group_id = aws_security_group.worker_nodes.id
}