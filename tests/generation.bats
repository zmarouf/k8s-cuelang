@test "awesome-service can be dumped." {
 run bash cue_dump.sh backend awesome-service
 [ "$status" -eq 0 ]
}

@test "cool-service can be dumped." {
 run bash cue_dump.sh backend cool-service
 [ "$status" -eq 0 ]
}

@test "awesome-service manifest is valid. (kubeval)" {
 run kubeval backend/awesome-service/kube.yaml
 [ "$status" -eq 0 ]
}

@test "cool-service manifest is valid. (kubeval)" {
 run kubeval backend/awesome-service/kube.yaml
 [ "$status" -eq 0 ]
}
