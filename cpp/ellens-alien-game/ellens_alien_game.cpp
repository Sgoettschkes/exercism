namespace targets {
  class Alien {
    public:
      Alien(int x, int y) {
        x_coordinate = x;
        y_coordinate = y;
        health = 3;
      }
      int get_health() {
        return health;
      }
      int hit() {
        if (health > 0) {
          health--;
        }
        return health;
      }
      bool is_alive() {
        return health > 0;
      }
      bool teleport(int new_x, int new_y) {
        x_coordinate = new_x;
        y_coordinate = new_y;

        return true;
      }
      bool collision_detection(Alien other) {
        return other.x_coordinate == x_coordinate && other.y_coordinate == y_coordinate;
      }
      int x_coordinate{};
      int y_coordinate{};
    private:
      int health{3};
  };

}  // namespace targets
