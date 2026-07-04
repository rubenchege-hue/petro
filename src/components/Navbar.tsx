"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { clsx } from "clsx";
import {
  LayoutDashboard,
  Fuel,
  TrendingUp,
  MapPin,
  PlusCircle,
  Droplets,
  Brain,
} from "lucide-react";
import { useState } from "react";

const navItems = [
  { href: "/", label: "Dashboard", icon: LayoutDashboard },
  { href: "/contribute", label: "Contribute", icon: PlusCircle },
  { href: "/prices", label: "Prices", icon: Fuel },
  { href: "/stations", label: "Stations", icon: MapPin },
  { href: "/analytics", label: "Analytics", icon: TrendingUp },
  { href: "/ai", label: "AI Insights", icon: Brain },
];

export default function Navbar() {
  const pathname = usePathname();
  const [mobileOpen, setMobileOpen] = useState(false);

  return (
    <>
      {/* Mobile header */}
      <div className="lg:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between bg-surface-950/90 backdrop-blur-xl border-b border-surface-800 px-4 h-16">
        <Link href="/" className="flex items-center gap-2.5">
          <div className="w-9 h-9 rounded-xl bg-gradient-to-br from-fuel-500 to-fuel-700 flex items-center justify-center shadow-lg shadow-fuel-500/20">
            <Droplets className="w-5 h-5 text-white" />
          </div>
          <span className="font-bold text-lg text-white">PetroFlow</span>
        </Link>
        <button
          onClick={() => setMobileOpen(!mobileOpen)}
          className="p-2 rounded-lg hover:bg-surface-800 transition-colors"
          aria-label="Toggle menu"
        >
          <div className="w-5 h-0.5 bg-surface-300 mb-1" />
          <div className="w-5 h-0.5 bg-surface-300 mb-1" />
          <div className="w-5 h-0.5 bg-surface-300" />
        </button>
      </div>

      {/* Mobile overlay */}
      {mobileOpen && (
        <div
          className="lg:hidden fixed inset-0 z-40 bg-black/60 backdrop-blur-sm"
          onClick={() => setMobileOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside
        className={clsx(
          "fixed top-0 left-0 z-50 h-full w-64 bg-surface-900/90 backdrop-blur-xl border-r border-surface-800 flex flex-col transition-transform duration-300 lg:translate-x-0",
          mobileOpen ? "translate-x-0" : "-translate-x-full"
        )}
      >
        {/* Logo */}
        <div className="p-5 border-b border-surface-800">
          <Link href="/" className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-fuel-500 to-fuel-700 flex items-center justify-center shadow-lg shadow-fuel-500/20">
              <Droplets className="w-5.5 h-5.5 text-white" />
            </div>
            <div>
              <span className="font-bold text-lg text-white block leading-tight">
                PetroFlow
              </span>
              <span className="text-xs text-surface-400 font-medium">
                Fuel Analytics
              </span>
            </div>
          </Link>
        </div>

        {/* Navigation */}
        <nav className="flex-1 p-3 space-y-1 overflow-y-auto custom-scrollbar">
          {navItems.map((item) => {
            const isActive = pathname === item.href;
            const Icon = item.icon;
            return (
              <Link
                key={item.href}
                href={item.href}
                onClick={() => setMobileOpen(false)}
                className={clsx(
                  "flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition-all duration-200",
                  isActive
                    ? "bg-fuel-500/10 text-fuel-400 border border-fuel-500/20 shadow-sm"
                    : "text-surface-400 hover:text-surface-200 hover:bg-surface-800/50 border border-transparent"
                )}
              >
                <Icon
                  className={clsx(
                    "w-5 h-5",
                    isActive && "text-fuel-400"
                  )}
                />
                <span>{item.label}</span>
                {isActive && (
                  <div className="ml-auto w-1.5 h-1.5 rounded-full bg-fuel-500" />
                )}
              </Link>
            );
          })}
        </nav>

        {/* Footer */}
        <div className="p-4 border-t border-surface-800">
          <div className="flex items-center gap-3 px-3 py-2">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-petro-500/20 to-petro-700/20 border border-petro-500/10 flex items-center justify-center">
              <span className="text-xs font-bold text-petro-400">PF</span>
            </div>
            <div className="text-xs text-surface-500">
              <span className="block font-medium text-surface-400">
                Community Driven
              </span>
              <span>v1.0.0</span>
            </div>
          </div>
        </div>
      </aside>

      {/* Spacer for fixed sidebar */}
      <div className="hidden lg:block w-64 flex-shrink-0" />

      {/* Mobile top spacer */}
      <div className="lg:hidden h-16" />
    </>
  );
}
