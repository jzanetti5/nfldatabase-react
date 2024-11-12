// src/components/RookiesList.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './RookiesList.css'; // Import the CSS file for styling
import BottomNav from './BottomNav'; // Import the BottomNav component

const RookiesList = () => {
  const [rookies, setRookies] = useState([]);
  const [expandedPlayer, setExpandedPlayer] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:3001/api/rookies')
      .then(response => {
        setRookies(response.data);
      })
      .catch(error => {
        console.error('There was an error fetching the rookies!', error);
      });
  }, []);

  const toggleDetails = (playerID) => {
    setExpandedPlayer(expandedPlayer === playerID ? null : playerID);
  };

  return (
    <div className="rookies-list">
      <h1>NFL Rookies</h1>
      <ul>
        {rookies.map(rookie => (
          <li key={rookie.p_playerid} className="rookie-item">
            <h2 onClick={() => toggleDetails(rookie.p_playerid)}>{rookie.p_name}</h2>
            {expandedPlayer === rookie.p_playerid && (
              <div className="rookie-details">
                <p><strong>Position:</strong> {rookie.p_positionid}</p>
                <p><strong>College:</strong> {rookie.p_collegeid}</p>
                <p><strong>Height:</strong> {rookie.p_height} inches</p>
                <p><strong>Weight:</strong> {rookie.p_weight} lbs</p>
                <p><strong>Age:</strong> {rookie.p_age}</p>
                <p><strong>Projected Stats:</strong> {rookie.p_projectedstats}</p>
                <p><strong>Actual Stats:</strong> {rookie.p_actualstats}</p>
              </div>
            )}
          </li>
        ))}
      </ul>
      <BottomNav /> {/* Include the BottomNav component */}
    </div>
  );
};

export default RookiesList;