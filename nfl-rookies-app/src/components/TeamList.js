// src/components/TeamList.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './TeamList.css'; // Import the CSS file for styling

const TeamList = () => {
  const [teams, setTeams] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:3001/api/teams')
      .then(response => {
        setTeams(response.data);
      })
      .catch(error => {
        console.error('There was an error fetching the teams!', error);
      });
  }, []);

  return (
    <div className="team-list">
      <h1>Teams</h1>
      
      <section id="section-teams">
        <ul>
          {teams.map(team => (
            <li key={team.t_teamid} className="team-item">
              <h3>{team.t_fullname}</h3>
              <div className="team-details">
                <p><strong>Team Key:</strong> {team.t_teamkey}</p>
                <p><strong>Division:</strong> {team.t_division}</p>
                <p><strong>Conference:</strong> {team.t_conference}</p>
                <p><strong>Head Coach:</strong> {team.t_headcoach}</p>
              </div>
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
};

export default TeamList;