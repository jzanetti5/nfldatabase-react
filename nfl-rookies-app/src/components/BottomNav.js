// src/components/BottomNav.js
import React from 'react';
import Box from '@mui/material/Box';
import BottomNavigation from '@mui/material/BottomNavigation';
import BottomNavigationAction from '@mui/material/BottomNavigationAction';
import PeopleIcon from '@mui/icons-material/People';
import SportsIcon from '@mui/icons-material/Sports';
import CategoryIcon from '@mui/icons-material/Category';

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
        <BottomNavigationAction label="Players" icon={<PeopleIcon />} />
        <BottomNavigationAction label="Teams" icon={<SportsIcon />} />
        <BottomNavigationAction label="Position" icon={<CategoryIcon />} />
      </BottomNavigation>
    </Box>
  );
};

export default BottomNav;