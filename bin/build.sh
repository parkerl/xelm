for example_file in exercises/**/*.example
do
  exercise_dir=$(dirname $example_file)
  exercise=$(basename $example_file .example)
  echo 'setting up .....'
  mv "$exercise_dir/$exercise.elm" "$exercise_dir/$exercise.impl"
  mv "$exercise_dir/$exercise.example" "$exercise_dir/$exercise.elm"
  echo 'building hello'
  elm-test exercises/hello_world/*Tests.elm
  echo 'building .....'
  elm-test exercises/**/*Tests.elm
  echo 'tearing do .....'
  mv "$exercise_dir/$exercise.elm" "$exercise_dir/$exercise.example"
  mv "$exercise_dir/$exercise.impl" "$exercise_dir/$exercise.elm"
done
