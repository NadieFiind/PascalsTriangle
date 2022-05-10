int size = 1;
float w, h;
int[][] grid;
void setup() {
  size(displayWidth, displayWidth);
  textAlign(CENTER);
  noStroke();
  fill(255, 0, 0);
  initialize();
}
void draw() {
  background(221);
  initialize();
  int[] emptySpots = new int[size];
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == 0) {
        emptySpots[j]++;
      }
    }
  }
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      float offset = emptySpots[j] / 2.0;
      float x = w * (i + offset);
      float y = h * j;
      if (grid[i][j] > 0) {
        text(grid[i][j], x + w / 2, y + h / 2);
      }
    }
  }
}
void initialize() {
  grid = new int[size][size];
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      if (i <= j) {
        if (i == 0 || i == j) {
          grid[i][j] = 1;
        } else {
          int sum;
          try {
            sum = grid[i][j - 1] + grid[i - 1][j - 1];
          } 
          catch (ArrayIndexOutOfBoundsException error0) {
            try {
              sum = grid[i - 1][j - 1];
            } 
            catch (ArrayIndexOutOfBoundsException error1) {
              sum = 0;
            }
          }
          grid[i][j] = sum;
        }
      } else {
        grid[i][j] = 0;
      }
    }
  }
  w = divisibler(width, size);
  h = divisibler(height, size);
  textSize(w / 2);
}
float divisibler(float num, float den) {
  float result = num / den;
  if (result % 1 != 0) {
    den -= 0.01;
    result = num / den;
  }
  return result;
}
void touchStarted() {
  size++;
}