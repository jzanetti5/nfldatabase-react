import psycopg2
import json

#USER ACTION REQUIRED
#Update the following variables according to your own local database

db = "james"
username = "james"
dbhost= '/tmp'
dbport = 8888

#Setting up connection to localdatabase which I will insert the data into
conn = psycopg2.connect(database = db, user = username, host= dbhost, port = dbport)
cursor = conn.cursor()

with open("college_data.json", "r") as file:
    college_data = json.load(file)

school_list = []
for college in college_data:
    college_abbrev = ""
    if college['school'] != None:
        college_abbrev = college['school']
    else:
        college_abbrev = college['alt_name1']
    school_list.append(college_abbrev)
    cursor.execute(
        "INSERT INTO college (c_collegeAbrev, c_collegeID, c_school, c_conference, c_division) VALUES (%s, %s, %s, %s, %s);",
        (college_abbrev, college['id'], college['school'], college['conference'], college['division'])
    )

with open("player_data.json", "r") as file:
    player_data = json.load(file)

for player in player_data:
    if player['Experience'] == 0 and player['College'] in school_list:
        for k in player.keys():
            if isinstance(player[k], str):
                player[k] = player[k].replace("'","''")
            else:
                if not player[k]:
                    player[k] = 0
        cursor.execute(f"INSERT INTO player(p_playerID, p_teamAbrev, p_playerNumber, p_firstName, p_lastName, p_postion, p_collegeKey, p_height, p_weight, p_postionCategory, p_playerShortName, p_age) VALUES ({player['PlayerID']}, '{player['Team']}', {player['Number']}, '{player['FirstName']}', '{player['LastName']}', '{player['Position']}', '{player['College']}', '{player['Height']}', {player['Weight']}, '{player['PositionCategory']}', '{player['Name']}', {player['Age']})")

with open("team_data.json", "r") as file:
    team_data = json.load(file)

for team in team_data:
        team["HeadCoach"] = team["HeadCoach"].replace("'","''")
        cursor.execute(f"INSERT INTO team(t_teamKey, t_teamID, t_fullName, t_division, t_conference, t_headCoach) VALUES ('{team['Key']}', {team['TeamID']}, '{team['FullName']}', '{team['Division']}', '{team['Conference']}', '{team['HeadCoach']}')")


with open("stats_data_2024.json", "r") as file:
    stats_data = json.load(file)

for player in stats_data:
        query = f"""
        INSERT INTO stats (s_playerID, s_seasonYear, s_teamKey, s_playerShortName, s_position, s_positionCategory, s_passingAttempts, s_passingCompletions, s_passingYards, s_passingCompletionPercentage, s_passingTouchdowns, s_passingInterceptions, s_rushingAttempts, s_rushingYards, s_rushingTouchdowns, s_receptions, s_receivingYards, s_receivingTouchdowns, s_fumbles, s_puntReturnYards, s_kickingReturnYards, s_sacks, s_sackYards, s_fumblesRecovered, s_interceptions, s_blockedKicks, s_punts, s_puntYards, s_fieldGoalsAttempts, s_fieldGoalsMade, s_touchdowns) 
        SELECT %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
        WHERE EXISTS (
            SELECT 1
            FROM player
            WHERE player.p_playerID = %s
        );
        """
        
        cursor.execute(query,(player["PlayerID"], player["Season"], player["Team"], player["Name"], player["Position"], player["PositionCategory"], player["PassingAttempts"], player["PassingCompletions"], player["PassingYards"], player["PassingCompletionPercentage"], player["PassingTouchdowns"], player["PassingInterceptions"], player["RushingAttempts"], player["RushingYards"], player["RushingTouchdowns"], player["Receptions"], player["ReceivingYards"], player["ReceivingTouchdowns"], player["Fumbles"], player["PuntReturnYards"], player["KickReturnYards"], player["Sacks"], player["SackYards"], player["FumblesRecovered"], player["Interceptions"], player["BlockedKicks"], player["Punts"], player["PuntYards"], player["FieldGoalsAttempted"], player["FieldGoalsMade"], player["Touchdowns"], player["PlayerID"]))

with open("rookie_drafted_data_2024.json", "r") as file:
    rookie_data = json.load(file) 

for rookie in rookie_data:
    if rookie["Team"]:
        rookie["Height"] = rookie["Height"].replace("'","''")
        rookie["FirstName"] = rookie["FirstName"].replace("'","''")
        rookie["LastName"] = rookie["LastName"].replace("'","''")
        if not rookie["Number"]:
            rookie["Number"] = 0
        
        query = f"""
        INSERT INTO drafted(d_playerID, d_teamKey, d_playerNumber, d_firstName, d_lastName, d_position, d_positionCategory, d_collegeKey, d_height, d_weight, d_age, d_draftYear)
        SELECT %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
        WHERE EXISTS (
            SELECT 1
            FROM player
            WHERE player.p_playerID = %s
        );
        """
        cursor.execute(query,(rookie["PlayerID"],rookie["Team"], rookie["Number"], rookie["FirstName"], rookie["LastName"], rookie["Position"], rookie["PositionCategory"], rookie["College"],rookie["Height"], rookie["Weight"], rookie["Age"], 2024, rookie["PlayerID"]) )



conn.commit()
cursor.close()
conn.close()