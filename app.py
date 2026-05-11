import psycopg2
from psycopg2 import IntegrityError

def connect_db():
    try:
        # Establish connection to your game_tracker database
        connection = psycopg2.connect(
            user="postgres",
            host="localhost",
            database="game_tracker"
        )
        return connection
    except Exception as e:
        print(f"Connection Error: {e}")
        return None

def add_new_game(conn):
    print("\n--- Add a New Game ---")
    title = input("Enter Game Title: ")
    # NEW: Adding the date to satisfy the database constraint
    release_date = input("Enter Release Date (YYYY-MM-DD): ")
    price = input("Enter Price: ")
    dev_id = input("Enter Developer ID: ")
    
    try:
        cursor = conn.cursor()
        # Updated SQL to include releasedate
        sql = "INSERT INTO games (title, releasedate, price, devid) VALUES (%s, %s, %s, %s)"
        cursor.execute(sql, (title, release_date, price, dev_id))
        conn.commit()
        print(f"\nSUCCESS: '{title}' has been added to the database!")
        
    except Exception as e:
        conn.rollback()
        print(f"\nDATABASE ERROR: {e}")

def show_premium_report(conn):
    try:
        cursor = conn.cursor()
        # Reusing one of your advanced queries from the previous milestone
        query = """
            SELECT d.DevName, COUNT(g.GameID) as PremiumGames
            FROM Developers d
            JOIN Games g ON d.DevID = g.DevID
            WHERE g.Price > 50.00
            GROUP BY d.DevName;
        """
        cursor.execute(query)
        results = cursor.fetchall()
        
        print("\n--- PREMIUM DEVELOPER REPORT ---")
        for row in results:
            print(f"Developer: {row[0]} | Premium Games: {row[1]}")
    except Exception as e:
        print(f"Error loading report: {e}")

def main():
    conn = connect_db()
    if not conn: return

    while True:
        print("\n--- GAME TRACKER INTERFACE ---")
        print("1. Add New Game")
        print("2. View Premium Developer Report")
        print("3. Exit")
        
        choice = input("Select an option: ")
        
        if choice == '1':
            add_new_game(conn)
        elif choice == '2':
            show_premium_report(conn)
        elif choice == '3':
            conn.close()
            print("Goodbye!")
            break
        else:
            print("Invalid selection.")

if __name__ == "__main__":
    main()