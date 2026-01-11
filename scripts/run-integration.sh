docker-compose up -d
echo '🟡 - Waiting for database to be ready...'
./scripts/wait-for-it.sh "postgresql://postgres:admin@123@localhost:5432/postgres" -- echo '🟢 - Database is ready!'
npm install prisma@5 @prisma/client@5
npx prisma migrate dev --name init
npm run test
docker-compose down