"use client";

import {
  PlusCircle,
  TrendingUp,
  Shield,
  Users,
  Clock,
} from "lucide-react";
import SubmitPriceForm from "@/components/SubmitPriceForm";

const features = [
  {
    icon: TrendingUp,
    title: "Real-time Updates",
    description: "Prices appear immediately after submission",
  },
  {
    icon: Users,
    title: "Community Powered",
    description: "Join thousands of contributors tracking fuel costs",
  },
  {
    icon: Shield,
    title: "No Account Needed",
    description: "Submit prices anonymously, no sign-up required",
  },
  {
    icon: Clock,
    title: "Help Everyone Save",
    description: "Your contribution helps others find the best prices",
  },
];

export default function ContributePage() {
  return (
    <div className="page-container space-y-8 animate-fade-in">
      {/* Header */}
      <div>
        <div className="flex items-center gap-2.5 mb-2">
          <div className="w-8 h-8 rounded-lg bg-fuel-500/15 border border-fuel-500/20 flex items-center justify-center">
            <PlusCircle className="w-4.5 h-4.5 text-fuel-400" />
          </div>
          <span className="text-xs font-semibold text-fuel-400 uppercase tracking-wider">
            Contribute
          </span>
        </div>
        <h1 className="page-title">Report Fuel Price (Kenya)</h1>
        <p className="page-subtitle">
          Help fellow Kenyans find the best fuel prices by sharing what you see at the pump.
          All prices in KSh per litre.
        </p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Form */}
        <div className="lg:col-span-2">
          <SubmitPriceForm />
        </div>

        {/* Sidebar */}
        <div className="space-y-4">
          <div className="glass-card p-5">
            <h3 className="font-semibold text-surface-200 mb-4">
              Why Contribute?
            </h3>
            <div className="space-y-4">
              {features.map((feature) => {
                const Icon = feature.icon;
                return (
                  <div key={feature.title} className="flex gap-3">
                    <div className="w-9 h-9 rounded-lg bg-surface-800/60 border border-surface-700/30 flex items-center justify-center shrink-0">
                      <Icon className="w-4.5 h-4.5 text-fuel-400" />
                    </div>
                    <div>
                      <p className="text-sm font-medium text-surface-200">
                        {feature.title}
                      </p>
                      <p className="text-xs text-surface-500 mt-0.5">
                        {feature.description}
                      </p>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          <div className="glass-card p-5">
            <h3 className="font-semibold text-surface-200 mb-3">
              Tips for Accurate Reports
            </h3>
            <ul className="space-y-2 text-sm text-surface-400">
              <li className="flex items-start gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-petro-500 mt-1.5 shrink-0" />
                Include the exact station name and location/landmark
              </li>
              <li className="flex items-start gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-petro-500 mt-1.5 shrink-0" />
                Select the correct county from the dropdown
              </li>
              <li className="flex items-start gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-petro-500 mt-1.5 shrink-0" />
                Report current prices you see today in KSh per litre
              </li>
              <li className="flex items-start gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-petro-500 mt-1.5 shrink-0" />
                Use "My Current Location" for automatic city/county detection
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}
