import React from "react";

const Exercise = ({ exerciseNumber, ExerciseComponent }) => (
  <div>
    <span> {exerciseNumber}: </span>
    {ExerciseComponent}
    <hr />
  </div>
);

export default Exercise;
