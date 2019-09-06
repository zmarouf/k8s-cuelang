@test "cue is installed." {
 run which cue
 [ "$status" -eq 0 ]
}

@test "kubeval is installed." {
 run which kubeval
 [ "$status" -eq 0 ]
}

@test "conftest is installed." {
 run which kubeval
 [ "$status" -eq 0 ]
}
