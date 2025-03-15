import { useEffect, useState } from 'react';
import './App.css';
import JokeList from './JokeList';

// const jokes = [
//   'Learn programming to understand programming jokes.',
//   'Code never lies,comments sometimes do.',
//   'You are semicolons to my Statements',
//   'Programming is 1% writing code and 99% understanding why its not working',
//   'I told him I cound not open jar. He told me to download java',
//   'Comparing java and javascript is same as comparing car and carpet',
//   'Golden rule of programming - If it works dont touch it.'
// ];


function App() {
  const [jokes,setJokes] = useState([])
  
  const fetchJoke = async ()=>{
    try{
        const res =  await fetch(`/api/getJokes`)
        const result = await res.json()
        setJokes(result.jokes) 
    }catch(err){
        console.log(err)
        alert("something went wrong")
    }
 
  }


  useEffect(()=>{
   fetchJoke()
  },[])
  return (
    <div className="App">
       <h1>Programming Jokes!</h1>
       <hr />
       <JokeList jokes={jokes} />
    </div>
  );
}

export default App;
