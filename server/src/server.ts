/* eslint-disable prettier/prettier */
import fastfy from 'fastify'
import cors from '@fastify/cors'
import { memoriesRoutes } from './routes/memories'
import { usersRoutes } from './routes/users'

const app = fastfy()

app.register(cors, {
  origin: true,
})
app.register(memoriesRoutes, usersRoutes)

app
  .listen({
    port: 3333,
  })
  .then(() => {
    console.log('🧑‍🚀 HTTP server running on http//localhost:3333')
  })
