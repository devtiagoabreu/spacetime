-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "githubId" INTEGER NOT NULL,
    "googleId" INTEGER NOT NULL,
    "planId" TEXT NOT NULL DEFAULT 'cf6d82eb-315e-4c89-96b2-55a26ce7428a',
    "planStartDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "planEndDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "pass" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "googleEmail" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    CONSTRAINT "User_planId_fkey" FOREIGN KEY ("planId") REFERENCES "Plan" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_User" ("avatarUrl", "email", "githubId", "googleEmail", "googleId", "id", "isActive", "login", "name", "pass", "planEndDate", "planId", "planStartDate") SELECT "avatarUrl", "email", "githubId", "googleEmail", "googleId", "id", "isActive", "login", "name", "pass", "planEndDate", "planId", "planStartDate" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_githubId_key" ON "User"("githubId");
CREATE UNIQUE INDEX "User_googleId_key" ON "User"("googleId");
CREATE TABLE "new_Plan" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL,
    "numberTokens" INTEGER NOT NULL,
    "numberLinks" INTEGER NOT NULL,
    "price" DECIMAL NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_Plan" ("description", "id", "isActive", "numberLinks", "numberTokens", "price") SELECT "description", "id", "isActive", "numberLinks", "numberTokens", "price" FROM "Plan";
DROP TABLE "Plan";
ALTER TABLE "new_Plan" RENAME TO "Plan";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
