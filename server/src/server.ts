/* eslint-disable prettier/prettier */
import 'dotenv/config'
import fastfy from 'fastify'
import cors from '@fastify/cors'
import jwt from '@fastify/jwt'
import { memoriesRoutes } from './routes/memories'
import { usersRoutes } from './routes/users'
import { authRoutes } from './routes/auth'

const app = fastfy()

app.register(cors, {
  origin: true,
})

app.register(jwt, {
  secret: 'd87hb-kx7x9-dqgh3-ffrdg-ym2d6',
})

app.register(authRoutes)
app.register(memoriesRoutes)
app.register(usersRoutes)

app
  .listen({
    port: 3333,
  })
  .then(() => {
    console.log('🧑‍🚀 HTTP server running on http//localhost:3333')
  })
