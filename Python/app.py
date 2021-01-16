
import streamlit as st
from vega_datasets import data
import altair as alt
import time

'# Benvenidos a mi app'

@st.cache
def get_cars():
    time.sleep(3) #Simulamos tiempo de carga
    return data.cars()

name = st.text_input('Quien eres?')

cars = get_cars()
country = st.selectbox('De que pais quieres ver datos',['USA', 'Europe','Japan'])

my_chart = alt.Chart(cars[cars['Origin']==country]).mark_point().encode(x='Displacement', y='Horsepower').interactive()
st.altair_chart(my_chart)

st.write(cars[cars['Origin']==country].head())

st.write('Gracias por visitar, %s' %name)
