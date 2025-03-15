import React from 'react'

const JokeList = ({jokes}) => {
   
  return (
    <>
    {jokes.length == 0 && <h4>No jokes found</h4>}
    { jokes.map(joke=><h4 key={joke._id}>{joke.joke}</h4>) }
    </>
   
  )
}

export default JokeList