/*
  Warnings:

  - The `status` column on the `Task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "TASK_STATUS" AS ENUM ('NOT_STARTED', 'STARTED', 'COMPLETED');

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "status",
ADD COLUMN     "status" "TASK_STATUS" NOT NULL DEFAULT 'NOT_STARTED';

-- DropEnum
DROP TYPE "Task_Status";

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
