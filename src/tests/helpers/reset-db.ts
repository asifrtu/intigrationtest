
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// export default async () => {
//   await prisma.$transaction([
//     prisma.request.deleteMany(),
//   ])
// }

export async function resetDb(){
  prisma.request.deleteMany()
}