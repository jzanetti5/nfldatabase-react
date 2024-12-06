import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './RookiesList.css';
import BottomNav from './BottomNav';

const RookiesList = () => {
  const [rookies, setRookies] = useState([]);
  const [expandedPlayer, setExpandedPlayer] = useState(null);
  const [playerStats, setPlayerStats] = useState({});
  const [expandedStats, setExpandedStats] = useState({});

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
    if (expandedPlayer === playerID) {
      setExpandedPlayer(null);
    } else {
      setExpandedPlayer(playerID);
      if (!playerStats[playerID]) {
        axios.get(`http://localhost:3001/api/stats/player/${playerID}`)
          .then(response => {
            console.log('Player stats:', response.data); // Log the response data in the console
            setPlayerStats(prevStats => ({
              ...prevStats,
              [playerID]: response.data
            }));
          })
          .catch(error => {
            console.error('There was an error fetching the player stats!', error);
          });
      }
    }
  };

  const toggleStats = (playerID) => {
    setExpandedStats(prevState => ({
      ...prevState,
      [playerID]: !prevState[playerID]
    }));
  };

  const displayValue = (value) => {
    return value ? value : 'N/A';
  };

  const filterStats = (stats) => {
    const excludedKeys = ['p_firstname', 'p_lastname', 'p_teamabrev', 'p_postion'];
    return Object.entries(stats).filter(([key, value]) => value !== null && value !== 'N/A' && !excludedKeys.includes(key));
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
                  {rookie.d_draftround && <p><strong>Draft Round:</strong> {displayValue(rookie.d_draftround)}</p>}
                  {rookie.d_draftpick && <p><strong>Draft Pick:</strong> {displayValue(rookie.d_draftpick)}</p>}
                  {playerStats[rookie.d_playerid] && (
                    <div className="player-stats">
                      <h4 onClick={() => toggleStats(rookie.d_playerid)} style={{ cursor: 'pointer' }}>
                        Stats {expandedStats[rookie.d_playerid] ? '▲' : '▼'}
                      </h4>
                      {expandedStats[rookie.d_playerid] && playerStats[rookie.d_playerid].map((stat, index) => (
                        <div key={index}>
                          {filterStats(stat).map(([key, value]) => (
                            <p key={key}><strong>{key.replace('s_', '').replace(/([A-Z])/g, ' $1').replace(/^./, str => str.toUpperCase())}:</strong> {displayValue(value)}</p>
                          ))}
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              )}
            </li>
          ))}
        </ul>
      </section>

      <BottomNav /> 
    </div>
  );
};

export default RookiesList;