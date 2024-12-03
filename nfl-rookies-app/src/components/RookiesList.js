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

  const displayValue = (value) => {
    return value ? value : 'N/A';
  };

  return (
    <div className="rookies-list">
      <h1>NFL Rookies</h1>
      
      <section id="section-players">
        <ul>
          {rookies.map(rookie => (
            <li key={rookie.d_playerid} className="rookie-item">
              <h3 onClick={() => toggleDetails(rookie.d_playerid)}>{displayValue(rookie.d_firstname)} {displayValue(rookie.d_lastname)}</h3>
              {expandedPlayer === rookie.d_playerid && (
                <div className="rookie-details">
                  <p><strong>Position:</strong> {displayValue(rookie.d_position)}</p>
                  <p><strong>College:</strong> {displayValue(rookie.d_collegekey)}</p>
                  <p><strong>Height:</strong> {displayValue(rookie.d_height)} inches</p>
                  <p><strong>Weight:</strong> {displayValue(rookie.d_weight)} lbs</p>
                  <p><strong>Age:</strong> {displayValue(rookie.d_age)}</p>
                  <p><strong>Draft Year:</strong> {displayValue(rookie.d_draftyear)}</p>
                  <p><strong>Draft Round:</strong> {displayValue(rookie.d_draftround)}</p>
                  <p><strong>Draft Pick:</strong> {displayValue(rookie.d_draftpick)}</p>
                </div>
              )}
            </li>
          ))}
        </ul>
      </section>

      <BottomNav /> {/* Include the BottomNav component */}
    </div>
  );
};

export default RookiesList;