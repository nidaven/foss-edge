option task = {
        name: "Fill Gap Task",
        every: 1h
    }
    from(bucket: "DOCKER_INFLUXDB_INIT_BUCKET")
      |> range(start: -task.every)
      |> fill(usePrevious: true)
