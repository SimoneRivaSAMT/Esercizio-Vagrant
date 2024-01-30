sudo apt-get update
sudo apt-get install -y mysql-server

sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf <<EOF
  [mysqld]
  bind-address = 10.10.20.11
EOF

sudo mysql -e "CREATE DATABASE IF NOT EXISTS Persona;"
echo "Database Persona creato con successo"

sudo mysql -D Persona <<EOF
CREATE TABLE IF NOT EXISTS Utenti (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Età INT
);

INSERT INTO Utenti (ID, Nome, Età) VALUES
    (1, 'Mario Rossi', 30),
    (2, 'Luca Bianchi', 25);
EOF

sudo mysql -e "CREATE USER 'Simmy'@'10.10.20.10' IDENTIFIED BY 'Password&1'";
sudo mysql -e "GRANT ALL PRIVILEGES ON Persona.* TO 'Simmy'@'10.10.20.10' WITH GRANT OPTION";

sudo systemctl restart mysql
echo "Tabella Utenti creata e dati inseriti con successo"