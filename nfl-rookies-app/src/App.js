import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import RookiesList from './components/RookiesList';
import CollegeList from './components/CollegeList';
import PositionsList from './components/PositionsList';
import TeamList from './components/TeamList';
import BottomNav from './components/BottomNav';

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/rookies" element={<RookiesList />} />
          <Route path="/colleges" element={<CollegeList />} />
          <Route path="/positions" element={<PositionsList />} />
          <Route path="/teams" element={<TeamList />} />
          <Route path="/" element={<RookiesList />} />
        </Routes>
        <BottomNav />
      </div>
    </Router>
  );
}

export default App;