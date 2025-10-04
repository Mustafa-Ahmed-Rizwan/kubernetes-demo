import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({ message: 'Hello from container!',
             service:'hello-node',
            pod: process.env.POD_NAME || 'unknown',
            time: new Date().toISOString(),
      

   });

});

// both of these two endpoints are needed for kubernetes to know that our app is alive and well.
app.get('/readyz', (req, res) => res.status(200).send('Ready'));
app.get('/healthz', (req, res) => res.status(200).send('Ok'));

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
