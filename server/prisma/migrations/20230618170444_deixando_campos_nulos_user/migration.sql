-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "githubId" INTEGER NOT NULL,
    "planId" TEXT NOT NULL DEFAULT 'cf6d82eb-315e-4c89-96b2-55a26ce7428a',
    "planStartDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "planEndDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT DEFAULT '',
    "email" TEXT DEFAULT '',
    "pass" TEXT DEFAULT '',
    "login" TEXT DEFAULT '',
    "avatarUrl" TEXT DEFAULT '',
    "isActive" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_User" ("avatarUrl", "email", "githubId", "id", "isActive", "login", "name", "pass", "planEndDate", "planId", "planStartDate") SELECT "avatarUrl", "email", "githubId", "id", "isActive", "login", "name", "pass", "planEndDate", "planId", "planStartDate" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_githubId_key" ON "User"("githubId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
