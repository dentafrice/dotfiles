function ur() {
    uds --no-haproxy stop $1
    uds --no-haproxy start $1
}
