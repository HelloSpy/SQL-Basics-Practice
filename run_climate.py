import requests
import pandas as pd
import mysql.connector
from datetime import datetime

cities = {
    "Delhi": (28.6139, 77.2090),
    "Mumbai": (19.0760, 72.8777),
    "Bengaluru": (12.9716, 77.5946),
    "Kolkata": (22.5726, 88.3639)
}

records = []
base_url = "https://api.open-meteo.com/v1/forecast"

for city, (lat, lon) in cities.items():
    query_params = {
        "latitude": lat,
        "longitude": lon,
        "current_weather": "true"
    }
    response = requests.get(base_url, params=query_params).json()
    
    if "current_weather" in response:
        current = response["current_weather"]
        temp = current["temperature"]
        wind = current["windspeed"]
        code = current["weathercode"]
        obs_time = current["time"].replace("T", " ") + ":00"
        alert_flag = 1 if temp > 38.0 else 0
        
        records.append({
            "city": city,
            "recorded_at": obs_time,
            "temperature_c": temp,
            "windspeed_kmh": wind,
            "weather_code": code,
            "is_alert": alert_flag
        })

df = pd.DataFrame(records)
df.to_excel("latest_climate_snapshot.xlsx", index=False)

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Your_Password",
    database="amishadb"
)
cursor = conn.cursor()

insert_query = """
INSERT IGNORE INTO climate_logs 
(city, recorded_at, temperature_c, windspeed_kmh, weather_code, is_alert)
VALUES (%s, %s, %s, %s, %s, %s)
"""

for row in df.itertuples(index=False):
    cursor.execute(insert_query, tuple(row))

conn.commit()
cursor.close()
conn.close()
print(f"[{datetime.now()}] Successfully logged {len(df)} city climate records!")