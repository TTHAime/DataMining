import { useState } from "react";

export default function Form({ onSubmit }) {
    const [formData, setFormData] = useState({
        age: "", gender: "", cholesterol: "", blood_pressure: "",
        glucose: "", bmi: "", smoking: "", alcohol: "",
        physical_activity: "", family_history: "", diet: "", sleep_hours: "",
        stress_level: "", medication: "", heart_rate: "", systolic_bp: "",
        diastolic_bp: "", waist_size: ""
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: name === "gender" ? value : parseFloat(value) || ""
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        onSubmit(formData);
    };

    return (
        <form onSubmit={handleSubmit} className="flex flex-col space-y-4">
            {[
                "age", "cholesterol", "blood_pressure", "glucose", "bmi",
                "physical_activity", "diet", "sleep_hours", "stress_level",
                "heart_rate", "systolic_bp", "diastolic_bp", "waist_size"
            ].map((field) => (
                <input key={field} className="border p-2 w-full rounded"
                    type="number" step="any" name={field} placeholder={field.replace("_", " ")}
                    onChange={handleChange} required />
            ))}

            {/* Gender Dropdown */}
            <select className="border p-2 w-full rounded" name="gender" onChange={handleChange} required>
                <option value="">Select Gender</option>
                <option value="0">Male</option>
                <option value="1">Female</option>
            </select>

            {/* Yes/No Dropdowns */}
            {["smoking", "alcohol", "family_history", "medication"]
                .map((field) => (
                    <select key={field} className="border p-2 w-full rounded"
                        name={field} onChange={handleChange} required>
                        <option value="">{field.replace("_", " ")}</option>
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>
                ))}

            <button className="bg-blue-500 text-white p-2 rounded w-full" type="submit">Predict</button>
        </form>
    );
}
