#!/bin/bash

CHECKSUM=''
VERSION=''

while getopts v:c:p:r: flag
do
    case "${flag}" in
        p) PRODUCT=${OPTARG};;
        r) REPO=${OPTARG};;
        v) VERSION=${OPTARG};;
        c) CHECKSUM=${OPTARG};;
        *) error "Unexpected option ${flag}";;
    esac
done

if [ -z $PRODUCT ]; then
    echo "Product name is required"
    exit 1
fi

if [ -z $REPO ]; then
    echo "Repository name is required"
    exit 1
fi

if [ -z $CHECKSUM ]; then
    echo "Checksum is required"
    exit 1
fi

if [ -z $VERSION ]; then
    echo "Version is required"
    exit 1
fi

TEMPLATE="
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: \"$PRODUCT\",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: \"$PRODUCT\",
            targets: [\"$PRODUCT\"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: \"$PRODUCT\",
            url: \"https://github.com/sendbird/$REPO/releases/download/$VERSION/$PRODUCT.xcframework.zip\",
            checksum: \"$CHECKSUM\"
        ),
    ]
)"

echo -e "$TEMPLATE" > Package.swift
