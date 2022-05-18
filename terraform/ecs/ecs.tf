resource "aws_ecs_task_definition" "ecs-ecs-task-definition" {
  family                = "service"
  container_definitions = jsonencode([
    {
      name         = "express-one"
      image        = "service-one"
      cpu          = 2
      memory       = 256
      essential    = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    },
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-northeast-2a, ap-northeast-2c]"
  }
}

resource "aws_ecs_cluster" "ecs-ecs-cluster" {
  name = "${local.SERVICE_NAME}-ecs-cluster"
}

resource "aws_ecs_service" "ecs-ecs-service" {
  name    = "${local.SERVICE_NAME}-esc-service"
  cluster = aws_ecs_cluster.ecs-ecs-cluster.id
}
