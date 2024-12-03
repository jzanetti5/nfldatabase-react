// src/components/BottomNav.js
import React from 'react';
import Box from '@mui/material/Box';
import BottomNavigation from '@mui/material/BottomNavigation';
import BottomNavigationAction from '@mui/material/BottomNavigationAction';
import PeopleIcon from '@mui/icons-material/People';
import SportsIcon from '@mui/icons-material/Sports';
import CategoryIcon from '@mui/icons-material/Category';
import SchoolIcon from '@mui/icons-material/School';
import { Link } from 'react-router-dom';

const BottomNav = () => {
  const [value, setValue] = React.useState(0);

  return (
    <Box sx={{ width: '100%' }} className="bottom-nav">
      <BottomNavigation
        showLabels
        value={value}
        onChange={(event, newValue) => {
          setValue(newValue);
        }}
      >
        <BottomNavigationAction label="Players" icon={<PeopleIcon />} component={Link} to="/rookies" />
        <BottomNavigationAction label="Teams" icon={<SportsIcon />} component={Link} to="/teams" />
        <BottomNavigationAction label="Position" icon={<CategoryIcon />} component={Link} to="/positions" />
        <BottomNavigationAction label="College" icon={<SchoolIcon />} component={Link} to="/colleges" />
      </BottomNavigation>
    </Box>
  );
};

export default BottomNav;