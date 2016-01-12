# Umbrella Phoenix Project Benchmark

How fast will you test suite be with 60 CRUD controllers?

A script generates 60 CRUD controllers in a Phoenix subproject.

The test suite (real database + real controller requests) finishes in total 17 seconds.
Most of the time ist spend loading files from disk, as it seems... The actual test run requires ca. 1 second, that is good news!


![tests](https://raw.githubusercontent.com/ruby2elixir/phoenix_crud_benchmark_60_controllers/master/running_tests.gif)

