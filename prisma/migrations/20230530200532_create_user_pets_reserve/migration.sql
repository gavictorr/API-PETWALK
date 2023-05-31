/*
  Warnings:

  - You are about to drop the `patches` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_patch` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "user_patch" DROP CONSTRAINT "user_patch_characterId_fkey";

-- DropForeignKey
ALTER TABLE "user_patch" DROP CONSTRAINT "user_patch_userId_fkey";

-- DropTable
DROP TABLE "patches";

-- DropTable
DROP TABLE "user_patch";

-- CreateTable
CREATE TABLE "Cachorros" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "raca" TEXT NOT NULL,
    "peso" DOUBLE PRECISION NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cachorros_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gatos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "raca" TEXT NOT NULL,
    "peso" DOUBLE PRECISION NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Gatos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reserva" (
    "userId" TEXT NOT NULL,
    "cachorroId" TEXT NOT NULL,
    "gatoId" TEXT NOT NULL,

    CONSTRAINT "reserva_pkey" PRIMARY KEY ("userId","cachorroId","gatoId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cachorros_nome_key" ON "Cachorros"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "Gatos_nome_key" ON "Gatos"("nome");

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_cachorroId_fkey" FOREIGN KEY ("cachorroId") REFERENCES "Cachorros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_gatoId_fkey" FOREIGN KEY ("gatoId") REFERENCES "Gatos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
