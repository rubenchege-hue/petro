import type { Metadata } from "next";
import "./globals.css";
import "leaflet/dist/leaflet.css";
import Navbar from "@/components/Navbar";

export const metadata: Metadata = {
  title: "PetroFlow Kenya — Fuel Price Analytics",
  description:
    "Community-driven fuel price tracking and analytics for Kenya. Find the cheapest Super Petrol, Diesel, Kerosene, and more across all 47 counties.",
  keywords: [
    "fuel prices Kenya",
    "petrol prices Kenya",
    "diesel prices Kenya",
    "fuel tracking",
    "petroflow",
    "cheapest fuel Kenya",
    "Kenya fuel stations",
    "TotalEnergies Kenya",
    "Shell Kenya",
  ],
  openGraph: {
    title: "PetroFlow Kenya — Fuel Price Analytics",
    description:
      "Community-driven fuel price tracking and analytics for Kenya. Find the cheapest fuel near you.",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className="dark">
      <body className="min-h-screen bg-surface-950">
        <div className="flex min-h-screen">
          <Navbar />
          <main className="flex-1 min-w-0 bg-surface-950">
            {children}
          </main>
        </div>
      </body>
    </html>
  );
}
