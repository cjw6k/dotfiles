@test "spark.fish is installed" (functions -q spark) $status = 0

@test "spark: ▁▁▂▂▃▃▄▄▅▅▆▆▇▇██" (spark 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16) = "▁▁▂▂▃▃▄▄▅▅▆▆▇▇██"
