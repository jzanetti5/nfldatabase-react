// src/components/CollegeList.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './CollegeList.css'; // Import the CSS file for styling

const CollegeList = () => {
  const [colleges, setColleges] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:3001/api/colleges')
      .then(response => {
        setColleges(response.data);
      })
      .catch(error => {
        console.error('There was an error fetching the colleges!', error);
      });
  }, []);

  return (
    <div className="college-list">
      <h1>Colleges</h1>
      
      <section id="section-colleges">
        <ul>
          {colleges.map(college => (
            <li key={college.c_collegeid} className="college-item">
              <h3>{college.c_school}</h3>
              <div className="college-details">
                <p><strong>Abbreviation:</strong> {college.c_collegeabrev}</p>
                <p><strong>Conference:</strong> {college.c_conference}</p>
              </div>
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
};

export default CollegeList;