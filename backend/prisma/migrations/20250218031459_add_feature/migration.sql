/*
  Warnings:

  - Added the required column `alcohol` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `blood_pressure` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bmi` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `diastolic_bp` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `diet` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `family_history` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `glucose` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `heart_rate` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `medication` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `physical_activity` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sleep_hours` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `smoking` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stress_level` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `systolic_bp` to the `Prediction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `waist_size` to the `Prediction` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Prediction" ADD COLUMN     "alcohol" INTEGER NOT NULL,
ADD COLUMN     "blood_pressure" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "bmi" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "diastolic_bp" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "diet" INTEGER NOT NULL,
ADD COLUMN     "family_history" INTEGER NOT NULL,
ADD COLUMN     "glucose" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "heart_rate" INTEGER NOT NULL,
ADD COLUMN     "medication" INTEGER NOT NULL,
ADD COLUMN     "physical_activity" INTEGER NOT NULL,
ADD COLUMN     "sleep_hours" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "smoking" INTEGER NOT NULL,
ADD COLUMN     "stress_level" INTEGER NOT NULL,
ADD COLUMN     "systolic_bp" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "waist_size" DOUBLE PRECISION NOT NULL;
