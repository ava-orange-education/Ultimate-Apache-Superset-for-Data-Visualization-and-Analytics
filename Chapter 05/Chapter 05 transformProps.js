export default function transformProps(chartProps) {
try {
const { width, height, formData, queriesData } = chartProps;

if (!queriesData?.[0]?.data) {
throw new Error('No data available');
}

const data = queriesData[0].data;

return {
width,
height,
data,
x: formData.x_axis,
y: formData.y_axis,
size: formData.bubble_size,
colorScheme: formData.color_scheme,
};
} catch (error) {
console.error('Error transforming props:', error);
return {
width: 0,
height: 0,
data: [],
error: true,
};
}
}
