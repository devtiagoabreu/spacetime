/*
  Warnings:

  - You are about to drop the column `googleEmail` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `googleId` on the `User` table. All the data in the column will be lost.
  - Made the column `githubId` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "githubId" INTEGER NOT NULL,
    "planId" TEXT NOT NULL DEFAULT 'cf6d82eb-315e-4c89-96b2-55a26ce7428a',
    "planStartDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "planEndDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL DEFAULT 'none',
    "email" TEXT NOT NULL DEFAULT 'none',
    "pass" TEXT NOT NULL DEFAULT 'none',
    "login" TEXT NOT NULL DEFAULT 'none',
    "avatarUrl" TEXT NOT NULL DEFAULT 'none',
    "isActive" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_User" ("avatarUrl", "email", "githubId", "id", "isActive", "login", "name", "pass", "planEndDate", "planId", "planStartDate") SELECT "avatarUrl", "email", "githubId", "id", "isActive", "login", "name", "pass", "planEndDate", "planId", "planStartDate" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_githubId_key" ON "User"("githubId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
