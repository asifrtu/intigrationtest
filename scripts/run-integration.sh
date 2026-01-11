#!/bin/sh
set -e

echo "🚀 Starting Docker containers..."
docker compose up -d

echo "🟡 - Waiting for database to be ready..."
./scripts/wait-for-it.sh "postgresql://postgres:admin%40123@localhost:5432/postgres" -- echo "🟢 - Database is ready!"

echo "📦 Installing Prisma..."
npm install prisma@5 @prisma/client@5

echo "📊 Running migrations..."
npx prisma migrate deploy

echo "🧪 Running tests..."
npm run test

echo "🧹 Shutting down containers..."
docker compose down
