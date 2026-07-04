"use client";

import { clsx } from "clsx";
import { TrendingUp, TrendingDown, type LucideIcon } from "lucide-react";

interface StatsCardProps {
  title: string;
  value: string | number;
  subtitle?: string;
  icon: LucideIcon;
  iconColor?: string;
  trend?: {
    direction: "up" | "down" | "neutral";
    value: string;
  };
  className?: string;
}

export default function StatsCard({
  title,
  value,
  subtitle,
  icon: Icon,
  iconColor = "text-fuel-400",
  trend,
  className,
}: StatsCardProps) {
  const TrendIcon =
    trend?.direction === "up"
      ? TrendingUp
      : trend?.direction === "down"
        ? TrendingDown
        : null;

  return (
    <div
      className={clsx(
        "stat-card group cursor-default",
        "hover:border-fuel-500/20 transition-all duration-300",
        className
      )}
    >
      <div className="flex items-start justify-between">
        <div className="flex flex-col gap-0.5">
          <span className="stat-label">{title}</span>
          <span className="stat-value text-white group-hover:text-gradient transition-all duration-300">
            {value}
          </span>
        </div>
        <div
          className={clsx(
            "w-10 h-10 rounded-xl flex items-center justify-center bg-surface-800/60 border border-surface-700/30",
            "group-hover:scale-110 transition-transform duration-300"
          )}
        >
          <Icon className={clsx("w-5 h-5", iconColor)} />
        </div>
      </div>

      <div className="flex items-center gap-2">
        {trend && TrendIcon && (
          <span
            className={clsx(
              "flex items-center gap-1 text-xs font-medium",
              trend.direction === "up" && "text-petro-400",
              trend.direction === "down" && "text-red-400"
            )}
          >
            <TrendIcon className="w-3.5 h-3.5" />
            {trend.value}
          </span>
        )}
        {subtitle && (
          <span className="text-xs text-surface-500">{subtitle}</span>
        )}
      </div>
    </div>
  );
}
