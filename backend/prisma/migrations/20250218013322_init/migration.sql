-- CreateTable
CREATE TABLE "Prediction" (
    "id" SERIAL NOT NULL,
    "age" INTEGER NOT NULL,
    "gender" INTEGER NOT NULL,
    "cholesterol" DOUBLE PRECISION NOT NULL,
    "prediction" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Prediction_pkey" PRIMARY KEY ("id")
);
