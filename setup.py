from setuptools import setup

setup(
    name='vanirguidaemon',
    version=open('version').read().strip(),
    packages=['vanirguidaemon'],
    entry_points={
        'vanir.ext':
            'mic = vanirguidaemon.mic:MicDeviceExtension',
        'vanir.devices':
            'mic = vanirguidaemon.mic:MicDevice',
    },
)
