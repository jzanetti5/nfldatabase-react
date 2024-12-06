import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './PositionsList.css';

const PositionsList = () => {
  const [positions, setPositions] = useState([]);
  const [selectedPosition, setSelectedPosition] = useState('QB');

  useEffect(() => {
    axios.get(`http://localhost:3001/api/players/position/${selectedPosition}`)
      .then(response => {
        setPositions(response.data);
      })
      .catch(error => {
        console.error('There was an error fetching the players by position!', error);
      });
  }, [selectedPosition]);

  const handlePositionChange = (position) => {
    setSelectedPosition(position);
  };

  return (
    <div className="positions-list">
      <h1>Players by Position</h1>
      
      <section id="section-positions">
        <div className="position-buttons">
          <button onClick={() => handlePositionChange('QB')}>Quarterback</button>
          <button onClick={() => handlePositionChange('RB')}>Running Back</button>
          <button onClick={() => handlePositionChange('WR')}>Wide Receiver</button>
          <button onClick={() => handlePositionChange('TE')}>Tight End</button>
          <button onClick={() => handlePositionChange('OL')}>Offensive Lineman</button>
          <button onClick={() => handlePositionChange('DL')}>Defensive Lineman</button>
          <button onClick={() => handlePositionChange('LB')}>Linebacker</button>
          <button onClick={() => handlePositionChange('DB')}>Defensive Back</button>
          <button onClick={() => handlePositionChange('K')}>Kicker</button>
          <button onClick={() => handlePositionChange('P')}>Punter</button>
        </div>
        <ul>
          {positions.map(player => (
            <li key={player.p_playerid} className="position-item">
              <h3>{player.p_firstname} {player.p_lastname}</h3>
              <div className="position-details">
                <p><strong>Position:</strong> {player.p_postion}</p>
                <p><strong>College:</strong> {player.p_collegekey}</p>
                <p><strong>Height:</strong> {player.p_height} inches</p>
                <p><strong>Weight:</strong> {player.p_weight} lbs</p>
                <p><strong>Age:</strong> {player.p_age}</p>
              </div>
            </li>
          ))}
        </ul>
      </section>
    </div>
  );
};

export default PositionsList;