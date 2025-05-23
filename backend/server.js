const express = require('express');
const path = require('path'); // Added path module
const app = express();
const port = process.env.PORT || 3000;

// Serve static files from the root directory
app.use(express.static(path.join(__dirname, '..')));

// Mock data for blog posts
const mockPosts = [
  { "id": 1, "title": "First Post from Backend", "content": "This is the first blog post, served dynamically!" },
  { "id": 2, "title": "Exploring the City", "content": "An article about urban adventures." },
  { "id": 3, "title": "Tech Talk", "content": "Discussing the latest in technology." }
];

// API endpoint to get blog posts
app.get('/api/posts', (req, res) => {
  res.json(mockPosts);
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
