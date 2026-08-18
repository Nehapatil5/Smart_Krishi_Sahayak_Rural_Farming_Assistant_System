# Smart Krishi Sahayak – Rural Farming Assistant System

A web-based platform that connects farmers with agricultural experts, and provides crop guidance, fertilizer recommendations, and government scheme information — built to support rural farming communities with easy access to expert advice and resources.

## Features

- **Farmer Portal** – register, log in, book appointments with experts, view crop suggestions, fertilizer recommendations, and government schemes
- **Expert Portal** – log in, view booked appointments, write and manage farmer reports
- **Admin Portal** – manage experts, farmers, crop data, fertilizer recommendations, and government scheme listings
- **Crop & Soil Guidance** – recommends crops based on soil type and season
- **Fertilizer Recommendations** – suggests fertilizer type and quantity by crop, soil, and season
- **Government Schemes** – lists relevant schemes for farmers across regions

## Tech Stack

- **Backend:** Java Servlets, JSP
- **Frontend:** HTML, CSS
- **Database:** MySQL
- **Server:** Apache Tomcat
- **IDE:** Eclipse (Dynamic Web Project)

## Project Structure

```
Smart_Krishi_Sahayak_Rural_Farming_Assistant_System/
├── src/Smart_Krishi_Sahayak/     # Java servlet source files
├── WebContent/                   # JSP and HTML pages
├── database/krishi_db.sql        # MySQL database schema + sample data
├── .classpath, .project          # Eclipse project files
```

## Database Setup

1. Install MySQL/MariaDB and start the server.
2. Create the database by importing the schema:
   ```
   mysql -u root -p < database/krishi_db.sql
   ```
   Or, in phpMyAdmin: create a database named `krishi_db`, then import `database/krishi_db.sql`.
3. This creates all required tables (`farmer`, `expert`, `appointments`, `crops`, `fertilizer_recommendations`, `reports`, `schemes`) with sample data.

## Running the Project

1. Import the project into Eclipse as an existing Dynamic Web Project.
2. Update database credentials in `src/Smart_Krishi_Sahayak/DbConnection.java` if needed (defaults to `root` with no password on `localhost:3306`).
3. Add the MySQL JDBC driver (already included in `WebContent/WEB-INF/lib/mysql.jar`).
4. Deploy the project to Apache Tomcat via Eclipse's built-in server, or export as a WAR file and deploy manually.
5. Open `index.html` in your browser via the running server (e.g. `http://localhost:8080/Smart_Krishi_Sahayak_Rural_Farming_Assistant_System/`).

## Author

Neha Patil — B.Tech AIML, R. C. Patel Institute of Technology
