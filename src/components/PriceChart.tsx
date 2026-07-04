"use client";

import {
  LineChart,
  Line,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
  AreaChart,
  Area,
} from "recharts";
import { clsx } from "clsx";

interface PriceChartProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  data: any[];
  type?: "line" | "area" | "bar";
  xKey: string;
  yKey: string;
  yKey2?: string;
  yKey3?: string;
  label?: string;
  label2?: string;
  label3?: string;
  color?: string;
  color2?: string;
  color3?: string;
  height?: number;
  className?: string;
  showGrid?: boolean;
  showLegend?: boolean;
  formatY?: (value: number) => string;
  formatX?: (value: string) => string;
  syncId?: string;
}

const COLORS = {
  fuel: "#f97316",
  fuelLight: "#fb923c",
  petro: "#22c55e",
  petroLight: "#4ade80",
  blue: "#3b82f6",
  purple: "#a855f7",
  red: "#ef4444",
  surface: "#334155",
};

function CustomTooltip({
  active,
  payload,
  label,
  formatY,
}: {
  active?: boolean;
  payload?: { name: string; value: number; color: string }[];
  label?: string;
  formatY?: (value: number) => string;
}) {
  if (!active || !payload?.length) return null;
  return (
    <div className="glass-card px-4 py-3 shadow-xl border-surface-700/50 min-w-[160px]">
      <p className="text-xs text-surface-400 mb-2 font-medium">{label}</p>
      {payload.map((entry, i) => (
        <div key={i} className="flex items-center justify-between gap-6">
          <div className="flex items-center gap-2">
            <div
              className="w-2.5 h-2.5 rounded-full"
              style={{ backgroundColor: entry.color }}
            />
            <span className="text-xs text-surface-300">{entry.name}</span>
          </div>
          <span className="text-xs font-semibold text-white">
            {formatY ? formatY(entry.value) : entry.value}
          </span>
        </div>
      ))}
    </div>
  );
}

export default function PriceChart({
  data,
  type = "area",
  xKey,
  yKey,
  yKey2,
  yKey3,
  label = "Price",
  label2,
  label3,
  color = COLORS.fuel,
  color2 = COLORS.petro,
  color3 = COLORS.blue,
  height = 300,
  className,
  showGrid = true,
  showLegend = true,
  formatY,
  formatX,
  syncId,
}: PriceChartProps) {
  const formatCurrency = (value: number) => `KSh ${value.toFixed(2)}`;
  const yFormatter = formatY || formatCurrency;

  const commonProps = {
    data,
    margin: { top: 5, right: 10, left: -10, bottom: 5 },
  };

  const renderChart = () => {
    switch (type) {
      case "bar":
        return (
          <BarChart {...commonProps}>
            {showGrid && (
              <CartesianGrid
                strokeDasharray="3 3"
                stroke={COLORS.surface}
                vertical={false}
              />
            )}
            <XAxis
              dataKey={xKey}
              tick={{ fill: "#94a3b8", fontSize: 11 }}
              tickLine={false}
              axisLine={false}
              tickFormatter={formatX}
            />
            <YAxis
              tick={{ fill: "#94a3b8", fontSize: 11 }}
              tickLine={false}
              axisLine={false}
              tickFormatter={yFormatter}
              width={60}
            />
            <Tooltip content={<CustomTooltip formatY={yFormatter} />} />
            {showLegend && (
              <Legend
                wrapperStyle={{ fontSize: "12px", color: "#94a3b8" }}
                iconType="circle"
              />
            )}
            <Bar
              dataKey={yKey}
              fill={color}
              radius={[4, 4, 0, 0]}
              name={label}
            />
            {yKey2 && (
              <Bar
                dataKey={yKey2}
                fill={color2}
                radius={[4, 4, 0, 0]}
                name={label2}
              />
            )}
          </BarChart>
        );

      case "line":
        return (
          <LineChart {...commonProps} syncId={syncId}>
            {showGrid && (
              <CartesianGrid
                strokeDasharray="3 3"
                stroke={COLORS.surface}
                vertical={false}
              />
            )}
            <XAxis
              dataKey={xKey}
              tick={{ fill: "#94a3b8", fontSize: 11 }}
              tickLine={false}
              axisLine={false}
              tickFormatter={formatX}
            />
            <YAxis
              tick={{ fill: "#94a3b8", fontSize: 11 }}
              tickLine={false}
              axisLine={false}
              tickFormatter={yFormatter}
              width={60}
            />
            <Tooltip content={<CustomTooltip formatY={yFormatter} />} />
            {showLegend && (
              <Legend
                wrapperStyle={{ fontSize: "12px", color: "#94a3b8" }}
                iconType="circle"
              />
            )}
            <Line
              type="monotone"
              dataKey={yKey}
              stroke={color}
              strokeWidth={2}
              dot={false}
              activeDot={{ r: 5, fill: color, strokeWidth: 0 }}
              name={label}
            />
            {yKey2 && (
              <Line
                type="monotone"
                dataKey={yKey2}
                stroke={color2}
                strokeWidth={2}
                dot={false}
                activeDot={{ r: 5, fill: color2, strokeWidth: 0 }}
                name={label2}
              />
            )}
          </LineChart>
        );

      default:
        return (
          <AreaChart {...commonProps} syncId={syncId}>
            {showGrid && (
              <CartesianGrid
                strokeDasharray="3 3"
                stroke={COLORS.surface}
                vertical={false}
              />
            )}
            <XAxis
              dataKey={xKey}
              tick={{ fill: "#94a3b8", fontSize: 11 }}
              tickLine={false}
              axisLine={false}
              tickFormatter={formatX}
            />
            <YAxis
              tick={{ fill: "#94a3b8", fontSize: 11 }}
              tickLine={false}
              axisLine={false}
              tickFormatter={yFormatter}
              width={60}
            />
            <Tooltip content={<CustomTooltip formatY={yFormatter} />} />
            {showLegend && (
              <Legend
                wrapperStyle={{ fontSize: "12px", color: "#94a3b8" }}
                iconType="circle"
              />
            )}
            <defs>
              <linearGradient id={`gradient-${yKey}`} x1="0" y1="0" x2="0" y2="1">
                <stop offset="5%" stopColor={color} stopOpacity={0.3} />
                <stop offset="95%" stopColor={color} stopOpacity={0} />
              </linearGradient>
              {yKey2 && (
                <linearGradient id={`gradient-${yKey2}`} x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor={color2} stopOpacity={0.3} />
                  <stop offset="95%" stopColor={color2} stopOpacity={0} />
                </linearGradient>
              )}
            </defs>
            <Area
              type="monotone"
              dataKey={yKey}
              stroke={color}
              strokeWidth={2}
              fill={`url(#gradient-${yKey})`}
              name={label}
            />
            {yKey2 && (
              <Area
                type="monotone"
                dataKey={yKey2}
                stroke={color2}
                strokeWidth={2}
                fill={`url(#gradient-${yKey2})`}
                name={label2}
              />
            )}
          </AreaChart>
        );
    }
  };

  if (!data?.length) {
    return (
      <div
        className={clsx(
          "glass-card flex items-center justify-center",
          className
        )}
        style={{ height }}
      >
        <p className="text-surface-500 text-sm">No data available yet</p>
      </div>
    );
  }

  return (
    <div className={clsx("glass-card p-5", className)}>
      <ResponsiveContainer width="100%" height={height}>
        {renderChart()}
      </ResponsiveContainer>
    </div>
  );
}
