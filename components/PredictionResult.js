export default function PredictionResult({ result }) {
    return result !== null && (
    <p className="mt-4 text-lg text-center">
        Prediction: {result > 0.5 ? "High Risk" : "Low Risk"}
    </p>
    );
}
