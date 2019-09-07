@test "awesome-service follows policies." {
 run conftest test --policy tests backend/awesome-service/kube.yaml
 [ "$status" -eq 0 ]
}

@test "cool-service follows policies." {
 run conftest test --policy tests backend/cool-service/kube.yaml
 [ "$status" -eq 0 ]
}
